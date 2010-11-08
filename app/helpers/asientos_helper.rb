module AsientosHelper
  def busca_sub_calc (mini, prog, refe)
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
  
  def busca_sub(asiento_or) 
    items = busca_sub_calc(asiento_or.mini_id, asiento_or.prog_id, asiento_or.cap_code) 
    salida = %&<table> <h2> #{@asiento.mini.desc} <br />
              Programa:  #{@asiento.prog.desc} </h2>
              <h3> #{items[1][0]} </h3>&
    @dep_desc_old = "" 
    items[0].each do |item| 
      salida += "<tr>"
      if @dep_desc_old != item.dep.desc then 
  	    salida += %&<td><br/>
  	             <strong> #{item.dep.desc} </strong></td>
  	             </tr><tr>&
  	    @dep_desc_old = item.dep.desc 
      end 
      if @asiento.cap_code != item.cap_code then
        salida += %&<td> #{item.desc} </td>&
        if item.cap_code <1000 then 
  	      salida += "<td></td>"
  	    end 
        if item.cap_code <100 then 
  	      salida += "<td></td>"
  	    end 
        salida += "<td>"
  	    if item.cap_code <10 then 
  	      salida += "<strong> #{item.cantidad} </strong>"
        else 
          salida += item.cantidad.to_s 
        end 
        salida += "</td>"
      else 
        salida += %&<td class = "rojo"> item.desc </td>&
        if item.cap_code <1000 then 
  	      salida += "<td></td>"
  	    end 	
        if item.cap_code <100 then 
  	      salida += "<td></td>"
  	    end 
        salida += %&<td class = "rojo"> item.cantidad </td>&
      end 
      salida += "</tr>"
    end
    salida
  end
  
  def similar_cantidad_calc(id)
    ident = Asiento.find(id).compara
    @punt = ident.id.to_i
    cerca = Compara.where("id > ? and id < ?",@punt-10, @punt + 10).each{ |s| s.asiento.desc} 
    cerca   
  end
  
  def similar_cantidad(asiento_or)
    comp = similar_cantidad_calc(asiento_or.id)    
    salida = ""
    comp.each do |c|  
      if c.asiento.id == asiento_or.id then  
        salida += "<div class='rojo'> "
      end
      salida += "Cap:" + c.asiento.cap_code.to_s[0,1] + " " 
      salida += "Prog:" + c.asiento.prog.desc  + " "  
      salida +="<strong>" + abrev(c.asiento.mini.desc) + "</strong> " 
      salida += c.asiento.dep.desc  + " "  
      salida += "<i>" + c.asiento.desc + "</i> = " 
      salida += c.asiento.cantidad.to_s + "<br />" + "</div> " 
      if c.asiento.id == asiento_or.id then  
        salida += "</div>"
      end
    end
    salida
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
