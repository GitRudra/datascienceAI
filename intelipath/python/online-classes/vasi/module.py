#!/usr/bin/env python
# coding: utf-8

# In[13]:


def add(*nums):
    total = 0
    for num in nums:
        total += num
    return total

def sub(*nums):
    total = 0
    if(nums): total = nums[0]
    for i in range(1, len(nums)):
        total -= nums[i]
    return total


# In[26]:


sub()


# In[23]:





# In[ ]:




