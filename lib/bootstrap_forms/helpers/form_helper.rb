module BootstrapForms
  module Helpers
    module FormHelper
      def bootstrap_form_for(record, options = {}, &block)
        options[:builder] = options[:builder] || BootstrapForms.default_form_builder
        form_for(record, options) do |f|
          if f.object.respond_to?(:errors)
            f.error_messages.html_safe + capture(f, &block).html_safe
          else
            capture(f, &block).html_safe
          end
        end
      end

      def bootstrap_fields_for(record, options = {}, &block)
        options[:builder] = options[:builder] || BootstrapForms.default_form_builder
        fields_for(record, nil, options, &block)
      end
    end
  end
end
