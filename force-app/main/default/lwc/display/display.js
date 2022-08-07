/**
 * @description       : 
 * @author            : Jonah Austin (OpFocus)
 * @group             : OpFocus
 * @last modified on  : 2022-08-07
 * @last modified by  : Jonah Austin (OpFocus)
**/
import { LightningElement } from 'lwc';

export default class Display extends LightningElement {
  counter = 0;
  augmentor = 1;

  get options() {
    return [
        { label: '1', value: 1 },
        { label: '2', value: 2 },
    ];
  }
  
  handleAugmentorChange(event) {
    this.augmentor = parseInt(event.target.value);
  }

  handleIncrement(event) {
    const operand = event.detail;
    this.counter += operand;
  }
  
  handleDecrement(event) {
    const operand = event.detail;
    this.counter -= operand;
  }
}