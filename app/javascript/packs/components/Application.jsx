import React from "react";
import Expeditions from "./Expeditions";

const expeditionsData = [
    {
        title: 'На Торманс'
    },
    {
        title: 'На Марс'
    },
    {
        title: 'На Венеру'
    }
];

export default class Application extends React.Component {
    render () {
        return (
            <div>
                <Expeditions values={expeditionsData} />
            </div>
        );
    }
}