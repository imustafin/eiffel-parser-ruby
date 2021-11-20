# frozen_string_literal: true

namespace :prepare do
  # ec should be in PATH
  desc "Generate ASCII formatted text of class file"
  task :format_class, [:class] do |_t, args|
    class_name = args[:class]
    e = "#{class_name}.e"
    ecf = "#{class_name}.ecf"
    txt = "#{class_name}.txt"

    sh "rm -f #{ecf}"
    sh "ec #{e}"
    sh "rm -f #{txt}"
    sh "ec -filter ASCII #{class_name} -config #{ecf} -file #{txt}"
    sh "rm #{ecf}"
    sh "rm #{class_name}"
    sh "rm -rf EIFGENs"
  end
end
