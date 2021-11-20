# frozen_string_literal: true

require_relative "lib/eiffel_parser/version"

Gem::Specification.new do |spec|
  spec.name          = "eiffel_parser"
  spec.version       = EiffelParser::VERSION
  spec.authors       = ["Ilgiz Mustafin"]
  spec.email         = ["ilgimustafin@gmail.com"]

  spec.summary       = "Access parsed Eiffel code"
  spec.description   = <<~DESC
    Takes Eiffel programs and gives access to
    parts of the code through nice classes
  DESC
  spec.homepage      = "https://github.com/imustafin/eiffel_parser"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'https://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/imustafin/eiffel_parser/blob/main/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem
  # that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    # rubocop:disable Layout/LineLength
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
    # rubocop:enable Layout/LineLength
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
