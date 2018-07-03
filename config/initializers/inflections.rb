ActiveSupport::Inflector.inflections(:en) do |inflect|
  # this allows us to use API as the namespace instead of the non-acronymed api
  inflect.acronym 'API'
end
