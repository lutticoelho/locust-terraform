from locust import task, between, events
from locust.contrib.fasthttp import FastHttpUser

class QuickstartUser(FastHttpUser):
    wait_time = between(1, 2)

    @task(100)
    def Home(self):
        # Home
        self.client.get("/", name="Home")
        self.client.get("/webpack-runtime-9473c2ad132629ca5c9f.js", name="runtime-js")
        self.client.get("/framework-094b0089736b8f621f0d.js", name="framework-js")
        self.client.get("/app-f8484bfc1f766a09b66b.js", name="app-js")
        self.client.get("/page-data/app-data.json", name="page-data-home")

        #Book
        self.client.get("/lideranca-e-gestao/livros-de-ceos/a-regra-e-nao-ter-regras-a-netflix-e-a-cultura-da-reinvencao", name="book-01")
        self.client.get("/page-data/lideranca-e-gestao/livros-de-ceos/a-regra-e-nao-ter-regras-a-netflix-e-a-cultura-da-reinvencao/page-data.json", name="page-data-book-01")

    @task(10)
    def Category(self):
        # Home
        self.client.get("/", name="Home")
        self.client.get("/webpack-runtime-9473c2ad132629ca5c9f.js", name="runtime-js")
        self.client.get("/framework-094b0089736b8f621f0d.js", name="framework-js")
        self.client.get("/app-f8484bfc1f766a09b66b.js", name="app-js")
        self.client.get("/page-data/app-data.json", name="page-data-home")

        # Category
        self.client.get("/lideranca-e-gestao", name="Category")
        self.client.get("/page-data/lideranca-e-gestao/page-data.json", name="page-data-category")
        
        # Book
        self.client.get("/lideranca-e-gestao/lideres-extraordinarios/responsabilidade-extrema-como-os-navy-seals-lideram-e-vencem", name="Book-02")
        self.client.get("/page-data/lideranca-e-gestao/lideres-extraordinarios/responsabilidade-extrema-como-os-navy-seals-lideram-e-vencem/page-data.json", name="page-data-book-02")

    @task(5)
    def Subcategory(self):

        # Home
        self.client.get("/", name="Home")
        self.client.get("/webpack-runtime-9473c2ad132629ca5c9f.js", name="runtime-js")
        self.client.get("/framework-094b0089736b8f621f0d.js", name="framework-js")
        self.client.get("/app-f8484bfc1f766a09b66b.js", name="app-js")
        self.client.get("/page-data/app-data.json", name="page-data-home")

        # Category
        self.client.get("/lideranca-e-gestao", name="Category")
        self.client.get("/page-data/lideranca-e-gestao/page-data.json", name="page-data-category")

        # Sub category
        self.client.get("/lideranca-e-gestao/lideres-extraordinarios", name="SubCategory")
        self.client.get("/page-data/lideranca-e-gestao/lideres-extraordinarios/page-data.json", name="page-data-subcategory")

        # Book
        self.client.get("/lideranca-e-gestao/lideres-extraordinarios/o-jogo-infinito", name="Book-03")
        self.client.get("/lideranca-e-gestao/lideres-extraordinarios/o-jogo-infinito/page-data.json", name="page-data-book-03")