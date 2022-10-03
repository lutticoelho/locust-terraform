from locust import task, between
from locust.contrib.fasthttp import FastHttpUser


class QuickstartUser(FastHttpUser):
    wait_time = between(1, 2)

    @task(10)
    def oauth_page(self):
        self.client.get("/", name="INDEX_PAGE")


    @task(3)
    def view_item(self):
        self.client.get(f"/lideranca-e-gestao/negocios/pense-de-novo-o-poder-de-saber-o-que-voce-nao-sabe", name="/item")
