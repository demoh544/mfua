# Примеры диаграмм Mermaid

В этом файле собраны основные типы диаграмм, графиков и блок-схем, поддерживаемых в **Mermaid**.

---

## 1. Блок-схема (Flowchart)
```mermaid
graph TD
    A[Начало] --> B{Есть решение?}
    B -- Да --> C[Применить]
    B -- Нет --> D[Поиск альтернатив]
    C --> E[Конец]
    D --> B
```

---

## 2. Диаграмма последовательности (Sequence Diagram)
```mermaid
sequenceDiagram
    autonumber
    Клиент->>Сервер: Запрос данных (API)
    Сервер->>База Данных: SELECT * FROM users
    База Данных-->>Сервер: Результат выборки
    Сервер-->>Клиент: HTTP 200 OK (JSON)
```

---

## 3. Диаграмма Ганта (Gantt Chart)
```mermaid
gantt
    title План разработки проекта
    dateFormat  YYYY-MM-DD
    section Проектирование
    Анализ требований       :a1, 2026-10-01, 5d
    Архитектура системы     :after a1, 7d
    section Разработка
    Создание базы данных    :2026-10-10, 4d
    Разработка API          :after a1, 10d
```

---

## 4. Круговая диаграмма (Pie Chart)
```mermaid
pie title Используемые технологии в проекте
    "Python" : 45
    "JavaScript" : 30
    "SQL" : 15
    "HTML/CSS" : 10
```

---

## 5. Диаграмма классов (Class Diagram)
```mermaid
classDiagram
    class User {
        +String name
        +String email
        +login()
    }
    class Admin {
        +String privileges
        +banUser(User user)
    }
    User <|-- Admin
```

---

## 6. Диаграмма состояний (State Diagram)
```mermaid
stateDiagram-v2
    [*] --> Черновик
    Черновик --> На_модерации : Отправить
    На_модерации --> Опубликовано : Одобрить
    На_модерации --> Черновик : Отклонить
    Опубликовано --> [*]
```

---

## 7. Диаграмма Entity Relationship (ER-диаграмма)
```mermaid
erDiagram
    CUSTOMER ||--o{ ORDER : places
    ORDER ||--|{ LINE-ITEM : contains
    CUSTOMER {
        string name
        string email
    }
```

---

## 8. Квадрант-граф (Quadrant Chart)
```mermaid
quadrantChart
    title Приоритет задач (Важность vs Срочность)
    x-axis Низкая срочность --> Высокая срочность
    y-axis Низкая важность --> Высокая важность
    quadrant-1 Сделать немедленно
    quadrant-2 Запланировать
    quadrant-3 Делегировать
    quadrant-4 Не делать
    Задача A: [0.3, 0.6]
    Задача B: [0.8, 0.9]
```

---

## 9. Ментальная карта (Mindmap)
```mermaid
mindmap
  root((Развитие IT))
    Программирование
      Frontend
      Backend
    Дизайн
      UI/UX
      Графика
    Маркетинг
```
