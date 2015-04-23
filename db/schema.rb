# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20150423015638) do

  create_table "cad_datatemp", :id => false, :force => true do |t|
    t.integer "id",                                           :null => false
    t.date    "data_inicial"
    t.date    "data_final"
    t.decimal "total_dinheiro", :precision => 9, :scale => 2
    t.decimal "total_debito",   :precision => 9, :scale => 2
    t.decimal "total_credito",  :precision => 9, :scale => 2
    t.decimal "total_cheque",   :precision => 9, :scale => 2
  end

  create_table "cad_despesa", :id => false, :force => true do |t|
    t.integer "id",                                                        :null => false
    t.string  "descr_despesa", :limit => 50
    t.decimal "preco_despesa",               :precision => 9, :scale => 2
    t.date    "data_cadastro"
    t.string  "atendente",     :limit => 50
  end

  create_table "cad_func", :id => false, :force => true do |t|
    t.integer "id",                    :null => false
    t.string  "nome",   :limit => 100
    t.string  "ende",   :limit => 100
    t.string  "bairro", :limit => 50
    t.string  "cidade", :limit => 100
    t.string  "uf",     :limit => 2
    t.string  "cep",    :limit => 20
    t.string  "email",  :limit => 50
    t.string  "fone",   :limit => 20
    t.string  "cargo",  :limit => 50
  end

  create_table "cadbairro", :id => false, :force => true do |t|
    t.integer "id",                                                      :null => false
    t.string  "nome_bairro", :limit => 50
    t.decimal "valor_taxa",                :precision => 9, :scale => 2
  end

  create_table "cadcli", :id => false, :force => true do |t|
    t.integer "id",                          :null => false
    t.string  "nome",        :limit => 100
    t.string  "fone1",       :limit => 20
    t.string  "fone2",       :limit => 20
    t.string  "ende",        :limit => 100
    t.string  "complemento", :limit => 100
    t.string  "bairro",      :limit => 50
    t.string  "cidade",      :limit => 50
    t.string  "uf",          :limit => 2
    t.string  "pontoref",    :limit => 50
    t.string  "email",       :limit => 50
    t.string  "obs",         :limit => 5000
    t.string  "numero",      :limit => 20
  end

  create_table "cadprod", :id => false, :force => true do |t|
    t.integer "id",                                                         :null => false
    t.string  "categoria",     :limit => 50
    t.string  "tipo",          :limit => 50
    t.string  "ref",           :limit => 50
    t.string  "descricao",     :limit => 200
    t.integer "quant_min"
    t.integer "quant_estoque"
    t.decimal "val_custo",                    :precision => 9, :scale => 2
    t.decimal "val_venda",                    :precision => 9, :scale => 2
    t.string  "local_estoque", :limit => 50
  end

  create_table "configsis", :id => false, :force => true do |t|
    t.integer "id",                               :null => false
    t.string  "nome_empresa",     :limit => 60
    t.string  "fone1",            :limit => 20
    t.string  "fone2",            :limit => 20
    t.string  "cidade",           :limit => 100
    t.string  "uf",               :limit => 2
    t.string  "caminho_logo",     :limit => 1000
    t.string  "caminho_rel",      :limit => 1000
    t.string  "ip_servidor",      :limit => 20
    t.string  "id_usuario",       :limit => 20
    t.string  "password_usuario", :limit => 20
    t.string  "nome_database",    :limit => 20
    t.string  "impressora_ativa", :limit => 10
    t.string  "wallpaper_type",   :limit => 50
  end

  create_table "dados_venda", :id => false, :force => true do |t|
    t.integer  "id",                                                        :null => false
    t.date     "data_venda"
    t.string   "nomecli",      :limit => 100
    t.string   "fonecli",      :limit => 20
    t.string   "endcli",       :limit => 100
    t.string   "numerocli",    :limit => 50
    t.string   "bairrocli",    :limit => 100
    t.string   "refcli",       :limit => 100
    t.decimal  "valor_frete",                 :precision => 9, :scale => 2
    t.datetime "hora_venda"
    t.decimal  "totalgeral",                  :precision => 9, :scale => 2
    t.string   "status",       :limit => 100
    t.string   "entregue_por", :limit => 100
    t.string   "forma_pagto",  :limit => 100
  end

  create_table "dataexp", :id => false, :force => true do |t|
    t.date   "data"
    t.string "condition",   :limit => 1
    t.string "expire_date", :limit => 3
  end

  create_table "descr_venda", :force => true do |t|
    t.integer  "id_venda"
    t.string   "cod",         :limit => 100
    t.string   "produto",     :limit => 100
    t.decimal  "valor_unit",                 :precision => 9, :scale => 2
    t.integer  "quant"
    t.decimal  "valor_total",                :precision => 9, :scale => 2
    t.string   "fonecli",     :limit => 20
    t.date     "data_venda"
    t.string   "tipo_prod",   :limit => 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "descr_vendas", :force => true do |t|
    t.integer  "id_venda"
    t.string   "cod"
    t.string   "produto"
    t.decimal  "valor_unit",                :precision => 9, :scale => 2
    t.integer  "quant"
    t.decimal  "valor_total",               :precision => 9, :scale => 2
    t.string   "fonecli"
    t.date     "data_venda"
    t.string   "tipo_prod"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pizza_pronta", :limit => 3
  end

  create_table "logsistema", :id => false, :force => true do |t|
    t.integer  "id",                           :null => false
    t.string   "nomeusuario",   :limit => 20
    t.datetime "data_exclusao"
    t.string   "n_doc",         :limit => 100
    t.string   "rotina",        :limit => 100
  end

  create_table "propriedades_usu", :id => false, :force => true do |t|
    t.integer "id",                      :null => false
    t.string  "nomeusu",   :limit => 50
    t.string  "m_dados",   :limit => 10
    t.string  "m_config",  :limit => 10
    t.string  "m_log",     :limit => 10
    t.string  "m_realiza", :limit => 10
    t.string  "c_cli",     :limit => 10
    t.string  "c_desp",    :limit => 10
    t.string  "c_func",    :limit => 10
    t.string  "c_prod",    :limit => 10
    t.string  "c_usu",     :limit => 10
    t.string  "v_nova",    :limit => 10
    t.string  "v_ativa",   :limit => 10
    t.string  "v_exclui",  :limit => 10
    t.string  "r_geral",   :limit => 10
    t.string  "r_consul",  :limit => 10
    t.string  "c_entrada", :limit => 10
  end

  create_table "testes", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "usuario", :id => false, :force => true do |t|
    t.integer "codusu",               :null => false
    t.string  "nome",   :limit => 20
    t.string  "senha",  :limit => 10
  end

end
