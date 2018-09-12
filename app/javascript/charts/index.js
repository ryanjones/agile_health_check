import React from "react";
import { render } from "react-dom";
import ApolloClient from "apollo-boost";
import { ApolloProvider } from "react-apollo";
import Teams from "./components/teams"

const client = new ApolloClient({});

const App = () => (
    <ApolloProvider client={client}>
        <Teams/>
    </ApolloProvider>
);


document.addEventListener("DOMContentLoaded", function(event) {
    render(<App />, document.getElementById('waffles'));
});
