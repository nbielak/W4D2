class DeletePendingColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :cat_rental_requests, :PENDING
  end
end
