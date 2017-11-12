require 'csv'

class Usuario < ApplicationRecord
  include Clearance::User

  validates_presence_of :nombre, :email, :localidad

  validates :nombre, uniqueness: true

  def geolocate
    if response = Geocoder.search("#{domicilio}, #{localidad}, Argentina")[0]
      update(latitude: response.coordinates[0], longitude: response.coordinates[1])
    end
  end

  def self.importar_afiliados
    CSV.parse(File.read('afiliados.csv')).each do |record|
      Usuario.create(email: record[1], nombre: record[2], password: record[3],
                     domicilio: record[4], localidad: record[5], movil: record[6])
    end
  end

  def self.geolocate_all
    Usuario.all.each do |usuario|
      usuario.geolocate
    end
  end

  def self.map_locations_json
    Usuario.all.map { |usuario| { lat: usuario.latitude, lng: usuario.longitude, infowindow: usuario.nombre.split.first } }
  end
end
