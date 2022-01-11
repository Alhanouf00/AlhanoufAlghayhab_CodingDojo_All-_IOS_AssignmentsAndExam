struct DoublyLinkedList<DataItem> {

    fileprivate var head : Node<DataItem>?
    fileprivate var tail : Node<DataItem>?
    var count = 0
    var isEmpty : Bool {
        return head == nil
    }

    //Append node
    mutating func Append(_ dataItem : DataItem) {
        let node = Node(dataItem: dataItem, nextNode: head, previousNode: nil)
        head?.previousNode = node
        head = node
        if tail == nil {
            tail = head
        }
        count += 1

    }

    //Append node at the end
    mutating func AppendAtEnd(_ dataItem : DataItem) {
        guard !isEmpty else {
            Append(dataItem)
            return
        }

        let newNode = Node(dataItem: dataItem, nextNode: nil, previousNode: tail)
        tail?.nextNode = newNode
        //newNode.previousNode = tail
        tail = newNode
        count += 1


    }

    //Append node at particular index
    mutating func AppendAtIndex(_ dataItem : DataItem , afterNode : Node<DataItem>) {
        let node = Node(dataItem: dataItem)
        afterNode.nextNode?.previousNode = node
        node.nextNode = afterNode.nextNode
        afterNode.nextNode = node
        node.previousNode = afterNode
        count += 1



    }

    //to find a node at particular index
    func findNode(at index : Int) -> Node<DataItem>? {
        var currentIndex = 0
        var currentNode =  head
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode?.nextNode
            currentIndex += 1
        }
        return currentNode
    }


    //remove the first node
    mutating func Shift() -> DataItem? {

        defer {
            head = head?.nextNode
            if isEmpty {
                head = nil
            }
        }

        return head?.dataItem
    }

    // print all nodes from head to tail
    func traverse()
    {
        var currentIndex = 0
        var currentNode =  head
        while currentNode != nil && currentIndex < count {
            print(currentNode!)
            currentNode = currentNode?.nextNode
           
            
            
            currentIndex += 1
        }
        
    }
    
    func traverseBackwards()
    {
        var currentIndex = count
        var LastNode =  tail
        while LastNode != nil && currentIndex != 0 {
            
            LastNode = LastNode?.previousNode
            print(LastNode!)
            
            
            currentIndex -= 1
        }
        
    }
    
    
    func size()->Int
    {
        return count

    }
    
    // remove the last node
    mutating func Pop() -> DataItem? {


        guard let headValue = head else {
            return nil
        }

        guard headValue.nextNode != nil else {
            return Shift()
        }

        var previous = headValue
        var current = headValue

        while let next = current.nextNode {
            previous = current
            current = next
        }

        previous.nextNode = nil
        tail = previous
        return current.dataItem

    }

    // remove from a specific location
    mutating func removeAt(at node : Node<DataItem>?) -> DataItem? {
        defer {
            if node === tail {
                Pop()
            }
            node?.previousNode?.nextNode = node?.nextNode
            node?.nextNode?.previousNode = node?.previousNode
        }
        return node?.nextNode?.dataItem
    }

}


extension DoublyLinkedList : CustomStringConvertible {

 var description : String {
        guard let doublyLinkedListHead = head else { return "UnderFlow"}
        //return String(describing: doublyLinkedListHead)
        return doublyLinkedListHead.linkedDescription
    }

}

class Node<DataItem> {
    var dataItem : DataItem
    var nextNode : Node?
    var previousNode : Node?



    init(dataItem : DataItem , nextNode : Node? = nil , previousNode : Node? = nil) {
        self.dataItem = dataItem
        self.nextNode = nextNode
        self.previousNode = previousNode
    }
}

extension Node : CustomStringConvertible {

    var description: String {
        return ((previousNode == nil) ? "nil" : "\(previousNode!.dataItem)") +
                "  \(dataItem)  " +
            ((nextNode == nil) ? "nil" : "\(nextNode!.dataItem)")
    }
        var linkedDescription: String {
            return "\(dataItem)" + ((nextNode == nil) ? "" : "  \(nextNode!.linkedDescription)")

        }

}

