import { Query } from "react-apollo";
import gql from "graphql-tag";
import React from "react";

const Teams = () => (
    <Query
        query={gql`
            query {
              agileTeams {
                id,
                name,
                kind
              }
            }
    `}
    >
        {({ loading, error, data }) => {
            if (loading) return <p>Loading...</p>;
            if (error) return <p>Error :(</p>;

            return data.agileTeams.map( item => (
                <div key={item.id}>
                    <p>{item.name}</p>
                </div>
            ));
        }}
    </Query>
);

export default Teams;