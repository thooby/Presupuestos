module AsientosHelper
  def busca_sub(mini, prog, refe)
    sub_seccion = refe.to_s[0..0]
    items = Asiento.where("(mini_id == ?)  and 
                           (prog_id == ?) and 
                           ( substr(cast(cap_code as text),1,1) == ?)", mini,prog,sub_seccion )
    cabe =[]
    items.each do |item|
       cabe << item.desc[5..-1] if item.desc[0..4]=="TOTAL"
    end    
    [items,cabe]
  end
  def similar_cantidad(id)
    ident = Asiento.find(id).compara
    @punt = ident.id.to_i
    cerca = Compara.where("id > ? and id < ?",@punt-10, @punt + 10).each{ |s| s.asiento.desc} 
    cerca   
  end
  def abrev(frase)
    comunes = ["DE","E","Y","LA"]
    ab =""
    fr = frase.split(" ")
    fr.each do |palab|
      ab += palab[0,1] if  not  comunes.index(palab)
    end
    ab
  end
    
end
