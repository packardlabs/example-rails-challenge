module ApplicationHelper
  def pretty_json(json)
    parsed_json = JSON.parse(json)
    JSON.pretty_generate(parsed_json)
  end
end
