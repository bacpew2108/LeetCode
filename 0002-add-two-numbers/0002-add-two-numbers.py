# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def addTwoNumbers(self, l1: Optional[ListNode], l2: Optional[ListNode]) -> Optional[ListNode]:
        head = ListNode(0)
        current = head
        carry = 0

        while l1 != None or l2 != None or carry != 0:
            digit1 = l1.val if l1 != None else 0
            digit2 = l2.val if l2 != None else 0

            sum = digit1 + digit2 + carry
            carry = sum // 10
            sum = sum % 10

            newnode = ListNode(sum)
            current.next = newnode
            current = current.next

            l1 = l1.next if l1 != None else None
            l2 = l2.next if l2 != None else None
        current.next = None
        return head.next