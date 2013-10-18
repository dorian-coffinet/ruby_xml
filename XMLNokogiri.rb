require 'nokogiri'
 
class XMLNokogiri
 
  attr_accessor :myDoc
 
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
	  @myDoc.write_xml_to(myFile, :indent =&gt; 4, :encoding =&gt; 'UTF-8')
	  myFile.close
	end

end