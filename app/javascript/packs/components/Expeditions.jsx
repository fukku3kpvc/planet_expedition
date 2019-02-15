import React from 'react';
import Expedition from "./Expedition";

export default class Expeditions extends React.Component {
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
               <Expedition expedition={value}/>
           );
        });
        return (
            <table className="table table-bordered">
                <thead>
                    <tr>
                        <th>Name</th>
                    </tr>
                </thead>
                <tbody>
                    {rows}
                </tbody>
            </table>
        );
    }

    componentDidMount() {
         fetch('/expeditions.json')
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