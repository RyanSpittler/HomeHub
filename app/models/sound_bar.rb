class SoundBar < Device

  INPUT_BASE_URL = "/menu_native/dynamic/audio_settings/input"

  def port
    "9001"
  end

  def scheme
    "http"
  end

  def domain
    "#{scheme}://#{ip_address}:#{port}"
  end

  def format
    "format=json"
  end

  def current_input_url
    view = "/current_input"
    path = INPUT_BASE_URL + view
    domain + path + "?" + format
  end

  def get_current_input
    uri = URI.parse(current_input_url)
    request = Net::HTTP::Get.new(uri.to_s)
    response = Net::HTTP.start(uri.host, uri.port) { |http| http.request(request) }
    JSON.parse(response.body)
  end

  def current_input_hashval
    get_current_input["ITEMS"][0]["HASHVAL"]
  end

  def set_current_input(value:)
    uri = URI.parse(current_input_url)
    parameters = {"HASHVAL": current_input_hashval, "REQUEST": "MODIFY", "VALUE": value}
    request = Net::HTTP::Put.new(uri.to_s, {"Content-Type" => "application/json"})
    request.body = JSON.dump(parameters)
    response = Net::HTTP.start(uri.host, uri.port) { |http| http.request(request) }
    JSON.parse(response.body)
  end

  def set_bluetooth
    set_current_input(value: :Bluetooth)
  end

  def set_optical
    set_current_input(value: :Optical)
  end

end
