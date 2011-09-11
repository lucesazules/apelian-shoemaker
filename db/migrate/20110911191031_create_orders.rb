class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

      t.string :razon_social
      t.string :cuit
      t.string :nombre
      t.string :apellido
      t.string :email
      t.string :email_confirm
      t.string :telefono
      t.string :celular
      t.string :calle
      t.string :nro
      t.string :piso
      t.string :depto
      t.string :provincia
      t.string :localidad
      t.string :codigo_postal

      t.timestamps
    end
  end
end