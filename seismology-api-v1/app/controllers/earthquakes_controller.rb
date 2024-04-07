class EarthquakesController < ApplicationController
    def index
        @earthquakes = Earthquake.all

        if params[:filters] && params[:filters][:mag_type]
            mag_types = params[:filters][:mag_type].split(',')
            @earthquakes = @earthquakes.where(magType: mag_types)
        end

        per_page = [params[:per_page].to_i, 1000].min
        @earthquakes = @earthquakes.paginate(page: params[:page], per_page: per_page)

        render json: {
            data: @earthquakes.map do |eq|
                {
                    id: eq.id,
                    type: 'feature',
                    attributes: {
                        external_id: eq.eq_id,
                        magnitude: eq.mag,
                        place: eq.place,
                        time: eq.time.to_s,
                        tsunami: eq.tsunami == 1,
                        mag_type: eq.magType,
                        title: eq.title,
                        coordinates: {
                            longitude: eq.longitude,
                            latitude: eq.latitude
                        }
                    },
                    links: {
                        external_url: eq.url
                    }
                }
            end,
            pagination: {
                current_page: @earthquakes.current_page,
                total: @earthquakes.total_entries,
                per_page: @earthquakes.per_page
            }
        }
    end
    
    def show
        @earthquake = Earthquake.find(params[:id])
        render json: @earthquake
    end
end
