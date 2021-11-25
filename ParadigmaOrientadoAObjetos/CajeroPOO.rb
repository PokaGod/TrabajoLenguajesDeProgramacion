
class Cajero
    attr_accessor :usuario, :cta_ahorro, :lna_credito , :rt_credito
    #Constructor
    def initialize(usuario,cta_ahorro,lna_credito) 
        @usuario = usuario
        @cta_ahorro = cta_ahorro
        @lna_credito = lna_credito
        @rt_credito = 0 # atributo que permite saber cantidad de dinero de la linea de credito retirado
        puts("Bienvenido al cajero")
    end
  
    #metodos
    #metodo para realizar retiros
   def retirar(tarjeta,monto)
    if (tarjeta == "ahorro")
        if cta_ahorro > monto
            self.cta_ahorro = cta_ahorro - monto #Se actualiza la cta de ahorros
            puts("Retire su dinero \n")
        else
            puts("Saldo insuficiente para el retiro\n")
        end
    elsif (tarjeta == "credito")
        if ((lna_credito*0.5) > monto) #1er filtro: Por dato no se puede retirar el 50% de la linea de credito, por eso se pregunta si el monto a retirar es mayor al 50%  
            self.rt_credito += monto #De pasar el 1er filtro se agrega el monto a retirar a la cantidad de retiros realizados
            if ((lna_credito*0.5) > rt_credito) #2do filtro:  Verificar si lo que se ha retirado sumado con lo que se planea retirar no supera el 50% de la linea de credito
                aux = monto*0.05 #Por dato se debe cobrar un monto adicional del 5% 
                self.rt_credito += aux
                puts("Retire el dinero, monto adicional cobrado por uso de tarjeta de credito: #{aux}\n ") 
            else
                puts("Transaccion cancelada. \n Usted intenta retirar mas del 50% de su linea de credito")
            end
        else
            puts("Transaccion cancelada. \n Usted intenta retirar mas del 50% de su linea de credito. ")
        end
    else
        puts("Error")
    end
   end
   #metodo para realizar deposito 
   def depositar(monto,tipo)
       if (tipo =="ahorro")
        self.cta_ahorro += monto 
        puts("Deposito en cuenta ahorros realizada")
       elsif (tipo == "pago credito") 
           puts("Pago de deuda realizado")
        else
           puts("Error")
       end
   end
   #Metodo para ver informacion de la cuenta 
   def consulta
       puts("El usuario #{usuario}, tiene un saldo de #{cta_ahorro} soles \ny una linea de credito de #{lna_credito} soles, de
        los cuales se han retirado #{rt_credito}")
   end

end
