# frozen_string_literal: true

namespace :prepare do
  desc "Prettify file with `ec -pretty` and write output to spec file"
  task :pretty, [:class, :spec] do |_t, args|
    class_name = args[:class]

    spec_name = args[:spec] || class_name

    spec = File.join(
      __dir__,
      "../../../spec/eiffel_parser",
      "#{spec_name}.e"
    )

    e = "#{class_name}.e"

    result = `ec -pretty \"#{e}\"`

    raise "Could not prettify" if result.empty?

    File.write(spec, result)
  end
end
