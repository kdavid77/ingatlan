module StaticPagesHelper
  def fulltitle(pagetitle)
    basetitle="Ingatlan"
    if (pagetitle.empty?)
      basetitle
    else
      basetitle + " | " + pagetitle
    end
  end
end
