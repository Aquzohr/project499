class AddNontrainerPackageToMember < ActiveRecord::Migration[5.0]
  def change
    add_reference :members, :nontrainer_package, foreign_key: true
  end
end
