class RemoveAuthorFromArticles < ActiveRecord::Migration[5.2]
  def change
    # typ, opcje i wartość domyślna podajemy, by migracja miała charakter odwracalny
    # (tzn. można odwrócić jej efekt poleceniem rails db:rollback)
    remove_column :articles, :author, :string, null: false, default: 'Nieznany', index: true
  end
end
