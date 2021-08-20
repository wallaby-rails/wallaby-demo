module Admin
  class AllPostgresTypeDecorator < ApplicationDecorator
    %i[color email password].each do |name|
      all_fields[name][:type] = name.to_s
    end
  end
end
