require 'XMLNokogiri'
# Load the XML doc
myXMLNokogiri = XMLNokogiri.new("./test.xml")
# Print the XML doc
myXMLNokogiri.readXML()
# Get the node of the gecko named Green
myXMLNokogiri.searchNode('//gecko[@name = "Green"]')
 
# Add a new gecko node with an attribute name Color
myNewNode = myXMLNokogiri.createANewNode('gecko')
myXMLNokogiri.addAnAttribute(myNewNode, 'name', 'Color')
myXMLNokogiri.addARootNode(myNewNode)
 
# Add a node couleur to the node we have just added
myNewNode = myXMLNokogiri.createANewNode('couleur')
myXMLNokogiri.addText(myNewNode, 'Multicolor')
myNode = myXMLNokogiri.searchNode('//gecko[@name = "Color"]')
myXMLNokogiri.insertAChildNode(myNode, myNewNode)
 
# We create a new doc and save it at the place of the old one (yeah, it's just to test eh :p)
myXMLNokogiri.myDoc = myXMLNokogiri.createANewDoc()
 
# We create a new node with an attribute
myNewNode = myXMLNokogiri.createANewNode('gecko')
myXMLNokogiri.addAnAttribute(myNewNode, 'name', 'Geckogeek')
# We create a new node and add it to the gecko node we have created
myNewChildNode = myXMLNokogiri.createANewNode('espece')
myXMLNokogiri.addText(myNewChildNode, 'Geek')
myXMLNokogiri.insertAChildNode(myNewNode, myNewChildNode)
# We add the gecko node to our new tree
myXMLNokogiri.addARootNode(myNewNode)
 
# We save this tree in a file
myXMLNokogiri.saveToFile("./test.xml")