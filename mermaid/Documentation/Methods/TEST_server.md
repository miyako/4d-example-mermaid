## mermaid🧜‍♀️


```mermaid
flowchart TD
    A[Start] --> B{Is it working?}
    B -- Yes --> C[Great!]
    B -- No --> D[Check logs]
    D --> E{Found error?}
    E -- Yes --> F[Fix the issue]
    E -- No --> G[Ask for help]
    F --> B
    G --> B
```    
