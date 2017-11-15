require 'csv'

class Usuario < ApplicationRecord
  validates :nombre, :email, :localidad, presence: true

  validates :nombre, uniqueness: true, length: { maximum: 50 }
  validates :dni, numericality: { only_integer: true, greater_than: 0, less_than: 60_000_000, allow_nil: true }
  validates :email, uniqueness: true, length: { maximum: 50 }
  validates :movil, length: { maximum: 30 }
  validates :domicilio, length: { maximum: 50 }
  validates :localidad, length: { maximum: 100 }
  validates :profesion, length: { maximum: 50 }
  validates :areas_conocimiento, length: { maximum: 100 }

  #has_secure_password

  after_initialize :after_initialize

  def geolocate
    if response = Geocoder.search("#{domicilio}, #{localidad}, Argentina")[0]
      update(latitude: response.coordinates[0], longitude: response.coordinates[1])
    end
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
    Usuario.all.select(&:activo_mapa_liberal).map { |usuario| { lat: usuario.latitude, lng: usuario.longitude } }
  end

  private

  def after_initialize
    self.activo_mapa_liberal = true if activo_mapa_liberal.nil?
  end
end
