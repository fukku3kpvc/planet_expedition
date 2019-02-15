import React from 'react';

export default class Spaceship extends React.Component {
    render() {
        const {spaceship} = this.props;
        return (
            <tr>
                <td>{spaceship.id}</td>
                <td>{spaceship.title}</td>
                <td>{spaceship.velocity}</td>
                <td>{spaceship.expedition.title}</td>
            </tr>
        );
    }
}