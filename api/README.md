# NLU API

This RESTful API helps in the management of entities, intents, and domains. Alongside, it exposes the parsing action, and also the management of parsed documents. It is based on [Rasa](https://rasa.ai/) for the NLU task, and also makes use of to parse the text into structured data. For data persistence we are using [ElasticSearch](https://www.elastic.co/products/elasticsearch), and for development tasks, we use [Kibana](https://www.elastic.co/products/kibana).

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

You will need `node.js` up and running your local machine. If you haven't installed it yet go to [node.js downloading page](https://nodejs.org/en/download/).

For dependency management, we use `yarn`. If you don't have `yarn` installed follow this [installing instructions]

To support the Rasa, Duckling, ElasticSearch and Kibana instances we use [docker](https://www.docker.com/) and `docker-compose`.

