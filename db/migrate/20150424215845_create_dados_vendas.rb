class CreateDadosVendas < ActiveRecord::Migration
  def change
    create_table :dados_vendas do |t|

      t.timestamps
    end
  end
end
