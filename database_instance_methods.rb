require "active_support"
require "active_support/inflector"

module DatabaseInstanceMethods

  # Get the value of a field for a given row.
  #
  # field - String of the column name.
  #
  # Returns the String value of the cell in the table.
  def get(field)

    table_name = self.class.to_s.pluralize.underscore

    result = CONNECTION.execute("SELECT * FROM #{table_name} WHERE id = #{@id}").first

    result[field]
  end

  def delete
    table_name = self.class.to_s.pluralize.underscore

    CONNECTION.execute("DELETE FROM #{table_name} WHERE id = #{@id}")
  end






  # This is an instance method that Takes all of the instance variables for an
  # object and inserts the name of each attribute as a key and the value of that attribute as
  # the value in a hash.
  #
  # This hash is then run through the .join(', ') and used to update data in the database.

  def save
    table = self.class.to_s.pluralize.underscore

    # Uses self.instance_variables to sets instance_variables to the attributes of the object
    # Without this line there would be no keys to add to the attribute_hash

    instance_variables = self.instance_variables

    attribute_hash = {}

    # Adds the attributes to the attribute_hash as keys
    #
    # self.send gets the value of each attribute by using its getter method
    #
    # variable.slice takes of the "@" part of the attributes

    instance_variables.each do |variable|
      attribute_hash["#{variable.slice(1..-1)}"] = self.send("#{variable.slice(1..-1)}")
    end

    individual_instance_variables = []

    # Adds the values of the attributes to the values of their corresponding keys
    #
    # value.is.a?(string) checks if the value is a string so it can put quotes around it as needed.

    attribute_hash.each do |key, value|
      if value.is_a?(String)
        individual_instance_variables << "#{key} = '#{value}'"
      else
        individual_instance_variables << "#{key} = #{value}"
      end
    end

    # Returns a string created by converting each element of the array to a string, separated by a comma and a space

    for_sql = individual_instance_variables.join(', ')

    CONNECTION.execute("UPDATE #{table} SET #{for_sql} WHERE id = #{self.id}")

    return self
  end
end