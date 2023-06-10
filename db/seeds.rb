# users
User.create(name: 'name1', user_name: 'user_name1', email: 'email1', phone: 'phone1', website: 'website1')
User.create(name: 'name2', user_name: 'user_name2', email: 'email2', phone: 'phone2', website: 'website2')
User.create(name: 'name3', user_name: 'user_name3', email: 'email3', phone: 'phone3', website: 'website3')

# todos
Todo.create(user_id: 1, title: 'title1', completed: true)
Todo.create(user_id: 2, title: 'title2', completed: false)
Todo.create(user_id: 3, title: 'title3', completed: true)