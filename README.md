# INSTRUÇÕES
- Os códigos foram desenvolvidos no Ruby 2.6.8.
- Altere o arquivo “config/database.yml” para atualizar as credenciais do banco de dados MySQL.
- Execute o comando **bundle install** para atualizar as dependências.
- Execute o comando **rails db:create db:migrate** para criar o banco de dados e as suas tabelas.
- Utilize o Postman para consumo da API.

# API ENDPOINTS

- POST /register - Cadastrar-se na API.
- POST /login - Autenticação na API.
- GET /myuser - Obter os dados do usuário que está logado
- GET /events - Obter todos os eventos.
- GET /events/:id - Obter os dados de um evento.
- POST /events - Inserir um novo evento.
- PATCH/PUT /events/:id - Editar os dados de um evento.
- DELETE /events/:id - Excluir um evento.
- POST /events/:event_id/subscribe - Inscrever-se em um evento.
- GET  /events/:id/get_participants - Obter participantes de um evento.
- POST /events/:event_id/prize - Dar um prêmio em um evento.
- GET  /events/:id/get_prizes - Obter premiados em um evento.