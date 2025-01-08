class Inn
  attr_accessor :name

  def initialize(name:)
    @name = name
  end

  def self.all
    begin
      inns = []
      response = Faraday.get('http://localhost:4000')

      if response.status == 200
        json_response = JSON.parse(response.body)
        json_response.each do |inn|
          inns << Inn.new(name: inn['name'])
        end
      end

      return inns
    rescue Faraday::ConnectionFailed => e
      Rails.logger.error e
    rescue => e
      Rails.logger.error "Erro: #{e}"
    end
    []
  end
end
