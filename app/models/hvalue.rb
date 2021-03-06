require 'csv'

class Hvalue < ActiveRecord::Base
    
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << csv_column_names
      all.each do |hvalue|
        csv << hvalue.attributes.values_at(*column_names)
      end
    end
  end
  
  def self.csv_column_names
    ["ID", "cityid", "自治体名", "ttl", "gw", "frs", "ib", "ft", "rs", "ss", "eac", "eps", "bu", "pa", "et", "mail", "vender", "ns", "cms", "ca", "fn", "ps", "作成日時", "更新日時"]
  end
  
  def csv_column_values
    [id, cityid, N03_004, ttl, gw, frs, ib, ft, rs, ss, eac, eps, bu, pa, et, mail, vender, ns, cms, ca, fn, ps]
  end
  
  def self.search(search)
    if search
       Hvalue.where("N03_004 like ?", "%#{search}%")
    else
       Hvalue.none
    end
  end
  
  def self.search_bureau(search_bureau)
    if search_bureau
       Hvalue.where("bureau like ?", "%#{search_bureau}%")
    else
       Hvalue.none
    end
  end
end
