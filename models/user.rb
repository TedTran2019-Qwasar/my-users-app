require_relative 'db_connection'

class User
  def self.create(user_info)
    DBConnection.execute(<<-SQL)
      INSERT INTO
        users (firstname, lastname, age, password, email)
      VALUES
        ('#{user_info[:firstname]}', '#{user_info[:lastname]}',
        '#{user_info[:age]}', '#{user_info[:password]}', '#{user_info[:email]}')
    SQL

    DBConnection.last_insert_row_id
  end

  def self.get(user_id)
    DBConnection.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        USERS
      WHERE
        id = ?
    SQL
    .first
  end

  def self.all
    DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        users
    SQL
  end

  def self.update(user_id, attribute, value)
    DBConnection.execute(<<-SQL, user_id)
      UPDATE
        users
      SET
        #{attribute} = '#{value}'
      WHERE
        id = ?
    SQL

    User.get(user_id)
  end

  def self.destroy(user_id)
    user = User.get(user_id)
    DBConnection.execute(<<-SQL, user_id)
      DELETE FROM
        users
      WHERE
        id = ?
    SQL

    user
  end
end

