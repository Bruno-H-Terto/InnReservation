class Inn
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def self.all
    inns = []
    response = Faraday.get('http://localhost:3000')

    if response.status == 200
      json_response = JSON.parse(response.body)
      json_response.each do |inn|
        inns << Inn.new(name: inn['name'])
      end
    end

    inns
  end
end
