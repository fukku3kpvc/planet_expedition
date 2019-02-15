import React from "react";
import Spaceships from "./Spaceships";

const spaceshipsData = [
    {
        id: 0,
        title: 'Sample',
        velocity: 0,
        expedition_id: 0
    }
];

export default class Application extends React.Component {
    render () {
        return (
            <div>
                <Spaceships values={spaceshipsData} />
            </div>
        );
    }
}