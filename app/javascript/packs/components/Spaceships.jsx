import React from 'react';
import Spaceship from "./Spaceship";

export default class Spaceships extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            values: []
        };
    }
    render () {
        const {values} = this.state;
        const rows = values.map(function (value) {
            return (
                <Spaceship spaceship={value}/>
            );
        });
        return (
            <table className="table table-bordered">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Velocity</th>
                    <th>Expedition</th>
                </tr>
                </thead>
                <tbody>
                {rows}
                </tbody>
            </table>
        );
    }

    componentDidMount() {
        fetch('/spaceships.json')
            .then((response) => response.json())
            .then((result) => {
                this.setState({
                    values: result
                })
            })
            .catch((err) => console.error(err))
        ;
    }
}