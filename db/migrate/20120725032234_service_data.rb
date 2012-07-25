class ServiceData < ActiveRecord::Migration
  def self.up
    sql_arr = []
    sql_arr << <<SQL
      INSERT INTO professional_services (service_name, service_type, service_rate, is_live, position) VALUES ('Hair & Make-Up', 'bride', '$250', true, 1);
SQL
    sql_arr << <<SQL
      INSERT INTO professional_services (service_name, service_type, service_rate, is_live, position) VALUES ('Hair Only', 'bride', '$150', true, 2);
SQL
    sql_arr << <<SQL
      INSERT INTO professional_services (service_name, service_type, service_rate, is_live, position) VALUES ('Make-Up Only', 'bride', '$150', true, 3);
SQL
    sql_arr << <<SQL
      INSERT INTO professional_services (service_name, service_type, service_rate, is_live, position) VALUES ('Trial', 'bride', '$125', true, 4);
SQL
    sql_arr << <<SQL
      INSERT INTO professional_services (service_name, service_type, service_rate, is_live, position) VALUES ('Hair & Make-Up', 'other', '$200', true, 1);
SQL
    sql_arr << <<SQL
      INSERT INTO professional_services (service_name, service_type, service_rate, is_live, position) VALUES ('Hair Only', 'other', '$110', true, 2);
SQL
    sql_arr << <<SQL
      INSERT INTO professional_services (service_name, service_type, service_rate, is_live, position) VALUES ('Make-Up Only', 'other', '$110', true, 3);
SQL
    sql_arr << <<SQL
      INSERT INTO professional_services (service_name, service_type, service_rate, is_live, position) VALUES ('Trial', 'other', '$100', true, 4);
SQL
    sql_arr << <<SQL
      INSERT INTO professional_services (service_name, service_type, service_rate, is_live, position) VALUES ('Flower Girl', 'other', '$40', true, 5);
SQL
    sql_arr << <<SQL
      INSERT INTO professional_services (service_name, service_type, service_rate, is_live, position) VALUES ('Hair Extensions', 'optional', '$100 per person / Trial + $50', true, 1);
SQL
    sql_arr << <<SQL
      INSERT INTO professional_services (service_name, service_type, service_rate, is_live, position) VALUES ('Airbrush Make-Up', 'optional', '$50 per person / Trial + $25', true, 2);
SQL
    sql_arr << <<SQL
      INSERT INTO professional_services (service_name, service_type, service_rate, is_live, position) VALUES ('Early Morning Fee (meeting before 7am)', 'optional', '$100', true, 3);
SQL
    sql_arr << <<SQL
      INSERT INTO professional_services (service_name, service_type, service_rate, is_live, position) VALUES ('Travel Fee (meeting outside of the N.Y.C area)', 'optional', 'starting at $100', true, 4);
SQL
    sql_arr.each do |s|
      execute s
    end
  end

  def self.down
  end
end
