require 'rubygems'
require 'nokogiri'
 
class XMLNokogiri
 
  attr_accessor :myDoc, :schema, :document
 
  def initialize(myFileName)
    loadXML(myFileName)
  end
 
  #load xml tree
	def loadXML(myFileName)
		begin
		  myFile = File.new(myFileName)
		rescue
		  puts "Can't open the file. Please check the name: " + myFileName + ". Try it again: "
		  myFileName = gets.chomp
		  retry
		end
		@myDoc = Nokogiri::XML(myFile)
	end

	#simple way to show elements
	def readXML()
	  # Get a node (or many)
	  for gecko in @myDoc.root.xpath("//gecko")
	 
	    # Get an attribute
	    puts gecko['name']
	 
	    # Get a text
	    puts "\t" + gecko.xpath("./espece").text
	    puts "\t" + gecko.xpath("./periode").text
	    puts "\t" + gecko.xpath("./region").text
	    puts "\t" + gecko.xpath("./taille").text
	    puts "\t" + gecko.xpath("./couleur").text
	    puts "\n"
		end
	end

	#find node with xPath, other way possible
	def searchNode(xpathExpr)
	  myNode = @myDoc.at(xpathExpr)
	 
	  if(myNode == nil)
	    puts "Not found..."
	  else
	    puts myNode.to_xml
	    return myNode
	  end
	end

	#add node
	def insertAChildNode(docPosition, myNode)
	  docPosition.add_child(myNode)
	end
	 
	def addARootNode(myNode)
	  @myDoc.root = myNode
	end

	#create new node
	def createANewNode(name)
  	return Nokogiri::XML::Node.new(name, @myDoc)
	end

	#add text and attribute
	def addAnAttribute(myNode, name, value)
	  myNode[name] = value
	end
	
	def addText(myNode, text)
	  myNode.content = text.to_s
	end

	#create new xml document
	def createANewDoc()
  	myNewDoc = Nokogiri::XML::Document.new
	end

	#save xml tree in file
	def saveToFile(myfileName)
	  begin
	    myFile = File.new(myfileName)
	  rescue
	  end
	 
	  myFile = File.open(myfileName, 'w')
	  @myDoc.write_xml_to(myFile, :indent => 4, :encoding => 'UTF-8')
	  myFile.close
	end

	# well formed xml documents
	def well_formed
		return myDoc.errors
	end

	#validate xml document with a schemas
	def read_schema(schema_path)
    @schema = Nokogiri::XML::Schema(File.read(schema_path))
  end

  def read_document(document_path)
    @document = Nokogiri::XML(File.read(document_path))
  end

  def validate(document_path, schema_path)
  	read_document(document_path)
  	read_schema(schema_path)
    @schema.validate(@document)
  end

  #transform xml to xsl
  def tramsform_xml_xsl(document_path, xsl_path)
  	doc   = Nokogiri::XML(File.read(document_path))
		xslt  = Nokogiri::XSLT(File.read(xsl_path))
		#warning difference between apply_to => serializable document, and tranform =>Nokogiri::Document
		return xslt.apply_to(doc)
	end

end

# Load the XML doc
myXMLNokogiri = XMLNokogiri.new("./doc/books.xml")
# # Print the XML doc
# myXMLNokogiri.readXML()

# # try to see if xml doc is well formed or not
# puts myXMLNokogiri.well_formed

# # try to validate xml doc with schemas
# myXMLNokogiri.validate("./doc/books.xml","./doc/books.xsd").each do |error|
#   puts error.message
# end

puts myXMLNokogiri.tramsform_xml_xsl("./doc/films2.xml","./doc/film1.xsl").to_s
# # Get the node of the gecko named Green
# myXMLNokogiri.searchNode('//gecko[@name = "Green"]')
 
# # Add a new gecko node with an attribute name Color
# myNewNode = myXMLNokogiri.createANewNode('gecko')
# myXMLNokogiri.addAnAttribute(myNewNode, 'name', 'Color')
# myXMLNokogiri.addARootNode(myNewNode)
 
# # Add a node couleur to the node we have just added
# myNewNode = myXMLNokogiri.createANewNode('couleur')
# myXMLNokogiri.addText(myNewNode, 'Multicolor')
# myNode = myXMLNokogiri.searchNode('//gecko[@name = "Color"]')
# myXMLNokogiri.insertAChildNode(myNode, myNewNode)
 
# # We create a new doc and save it at the place of the old one (yeah, it's just to test eh :p)
# myXMLNokogiri.myDoc = myXMLNokogiri.createANewDoc()
 
# # We create a new node with an attribute
# myNewNode = myXMLNokogiri.createANewNode('gecko')
# myXMLNokogiri.addAnAttribute(myNewNode, 'name', 'Geckogeek')
# # We create a new node and add it to the gecko node we have created
# myNewChildNode = myXMLNokogiri.createANewNode('espece')
# myXMLNokogiri.addText(myNewChildNode, 'Geek')
# myXMLNokogiri.insertAChildNode(myNewNode, myNewChildNode)
# # We add the gecko node to our new tree
# myXMLNokogiri.addARootNode(myNewNode)
 
# # We save this tree in a file
# myXMLNokogiri.saveToFile("./test.xml")