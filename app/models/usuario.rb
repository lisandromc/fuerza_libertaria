require 'csv'

class Usuario < ApplicationRecord
  validates :nombre, :email, :localidad, presence: true

  validates :administrador, inclusion: [true, false]
  validates :nombre, uniqueness: true, length: { maximum: 50 }
  validates :dni, numericality: { only_integer: true, greater_than: 0, less_than: 60_000_000, allow_nil: true }
  validates :email, uniqueness: true, length: { maximum: 50 }
  validates :movil, length: { maximum: 30 }
  validates :domicilio, length: { maximum: 50 }
  validates :localidad, length: { maximum: 100 }
  validates :provincia_id,
    inclusion: { in: Lookups::Provincias::CAPITAL_FEDERAL..Lookups::Provincias::TIERRA_FUEGO }, allow_blank: true
  validates :profesion, length: { maximum: 50 }
  validates :areas_conocimiento, length: { maximum: 100 }
  validates :usuario_slack, length: { maximum: 40 }
  validates :perfil_facebook, length: { maximum: 60 }
  validates :perfil_instagram, length: { maximum: 60 }
  validates :perfil_twitter, length: { maximum: 60 }
  validates :nombre_publico, inclusion: [true, false]
  validates :email_publico, inclusion: [true, false]
  validates :movil_publico, inclusion: [true, false]
  validates :profesion_publico, inclusion: [true, false]
  validates :areas_conocimiento_publico, inclusion: [true, false]
  validates :usuario_slack_publico, inclusion: [true, false]
  validates :perfil_facebook_publico, inclusion: [true, false]

  has_secure_password validations: false
  has_secure_token :reset_token

  after_initialize :after_initialize

  def prepare_reset_token
    regenerate_reset_token
    update_attribute(:reset_token_expire, 2.hour.from_now)
  end

  def reset_token_valid?(token)
    reset_token.present? && reset_token == token && Time.zone.now < reset_token_expire
  end

  def geolocate
    if response = Geocoder.search("#{domicilio}, #{localidad}, #{provincia}, Argentina")[0]
      update(latitude: response.coordinates[0], longitude: response.coordinates[1])
    end
  end

  def localizar_en_mapa?
    activo_mapa_liberal && latitude.present? && longitude.present?
  end

  def location
    { lat: latitude, lng: longitude }
  end

  def any_public_data?
    nombre_publico || email_publico || movil_publico || profesion_publico ||
      areas_conocimiento_publico || usuario_slack_publico || perfil_facebook_publico
  end

  def provincia
    Lookups::Provincias::PRINTABLE[provincia_id] if provincia_id
  end

  def self.importar_afiliados
    CSV.parse(File.read('afiliados.csv')).each do |record|
      Usuario.create(email: record[1], nombre: record[2], domicilio: record[4], localidad: record[5], movil: record[6])
    end
  end

  def self.geolocate_all
    Usuario.all.each do |usuario|
      usuario.geolocate
    end
  end

  def self.map_locations_json
    Usuario.all.select(&:localizar_en_mapa?).map(&:location)
  end

  private

  def after_initialize
    self.administrador       = false if administrador.nil?
    self.activo_mapa_liberal = true if activo_mapa_liberal.nil?
  end
end
