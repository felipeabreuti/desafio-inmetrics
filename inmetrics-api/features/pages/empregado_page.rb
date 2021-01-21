  #@username = "#{CONFIG['config_inmetrics']['username']}"
  #@password = "#{CONFIG['config_inmetrics']['password']}"

def post(endpoint, body)
  HTTParty.post(
  endpoint,
  headers: {'Content-Type' => 'application/json'},
  basic_auth: { username: "inmetrics", password: "automacao" },
  body: body.to_json
  )
end

def get(endpoint)
  HTTParty.get(
  endpoint,
  headers: {'Accept' => 'application/json'},
  basic_auth: { username: "inmetrics", password: "automacao" }
  )
end

def delete(endpoint)
  HTTParty.delete(
  endpoint,
  headers: {'Content-Type' => 'application/json'},
  basic_auth: { username: "inmetrics", password: "automacao" }
  )
end

def put(endpoint, body)
  HTTParty.put(
  endpoint,
  headers: {'Content-Type' => 'application/json'},
  basic_auth: { username: "inmetrics", password: "automacao" },
  body: body.to_json
  )
end