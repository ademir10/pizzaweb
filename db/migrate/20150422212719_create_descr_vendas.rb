class CreateDescrVendas < ActiveRecord::Migration
  def change
    create_table :descr_vendas do |t|
      t.integer :id_venda
      t.string :cod
      t.string :produto
      t.decimal :valor_unit
      t.integer :quant
      t.decimal :valor_total
      t.string :fonecli
      t.date :data_venda
      t.string :tipo_prod

      t.timestamps
    end
  end
end
