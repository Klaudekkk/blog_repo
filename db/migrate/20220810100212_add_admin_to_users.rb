class AddAdminToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :admin, :boolean, default: false
    #dla tabeli users dodaj kolumne admin typu bool i defaultowo ustaw false kazdemu
  end
end
