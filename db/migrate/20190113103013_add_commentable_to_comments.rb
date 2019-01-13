class AddCommentableToComments < ActiveRecord::Migration[5.2]
  def change
    # Usuwamy ograniczenie klucza obcego dla kolumny article_id w tabeli comments.
    # Dzięki temu po zmianie nazwy kolumna ta będzie mogła odnosić się do czegos innego,
    # niż artykuły
    remove_foreign_key :comments, :articles

    # Od teraz article_id niech nazywa się commentable_id
    rename_column :comments, :article_id, :commentable_id
    # Dodajmy kolumnę commentable_type i ustalmy, że domyślnie polimorficzny
    # związek commentable będzie odnosił się do modelu Article, bo przecież istniejące
    # rekordy dotyczą właśnie artykułów
    add_column :comments, :commentable_type, :string, null: false, default: 'Article'

    # Dodajmy indeks na typie i ID komentowalnego rekordu dla szybkiego przeszukiwania.
    # Istotne, że commentable_type jest na pierwszym miejscu, gdyż dzięki temu również po
    # samym commentable_type będzie można szybko przeszukiwać.
    add_index :comments, [:commentable_type, :commentable_id]
  end
end
