require 'httparty'

namespace :sismology do
    desc "Fetch and store earthquake data"
    task fetch_data: :environment do
        response = HTTParty.get('https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/1.0_month.geojson')
        earthquakes = response.parsed_response['features'] 
        metadata_title = response['metadata']['title']
      
        earthquakes.each do |eq|
            composed_title = "#{metadata_title} - #{eq['properties']['place']}"
            begin
                Earthquake.create!(
                    title: composed_title,
                    mag: eq['properties']['mag'],
                    place: eq['properties']['place'],
                    time: eq['properties']['time'],
                    updated: eq['properties']['updated'],
                    tz: eq['properties']['tz'],
                    url: eq['properties']['url'],
                    detail: eq['properties']['detail'],
                    felt: eq['properties']['felt'],
                    cdi: eq['properties']['cdi'],
                    mmi: eq['properties']['mmi'],
                    alert: eq['properties']['alert'],
                    status: eq['properties']['status'],
                    tsunami: eq['properties']['tsunami'],
                    sig: eq['properties']['sig'],
                    net: eq['properties']['net'],
                    code: eq['properties']['code'],
                    ids: eq['properties']['ids'],
                    sources: eq['properties']['sources'],
                    types: eq['properties']['types'],
                    nst: eq['properties']['nst'],
                    dmin: eq['properties']['dmin'],
                    rms: eq['properties']['rms'],
                    gap: eq['properties']['gap'],
                    magType: eq['properties']['magType'],
                    eq_type: eq['properties']['type'],
                    longitude: eq['geometry']['coordinates'][0],
                    latitude: eq['geometry']['coordinates'][1],
                    depth: eq['geometry']['coordinates'][2],
                    eq_id: eq['id']
                )
            rescue ActiveRecord::RecordInvalid => e
                puts "Registro no válido: #{e.record.errors.full_messages.join(", ")}"
            end
        end
    end
end