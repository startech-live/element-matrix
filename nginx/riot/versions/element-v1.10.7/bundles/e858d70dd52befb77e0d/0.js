(window.webpackJsonp=window.webpackJsonp||[]).push([[0],{434:function(t,e,i){"use strict";i.r(e),i.d(e,"DefaultOptions",(function(){return a})),i.d(e,"default",(function(){return c}));var n=i(83),s=i.n(n);function r(t,e){var i=Object.keys(t);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(t);e&&(n=n.filter((function(e){return Object.getOwnPropertyDescriptor(t,e).enumerable}))),i.push.apply(i,n)}return i}function o(t){for(var e=1;e<arguments.length;e++){var i=null!=arguments[e]?arguments[e]:{};e%2?r(Object(i),!0).forEach((function(e){s()(t,e,i[e])})):Object.getOwnPropertyDescriptors?Object.defineProperties(t,Object.getOwnPropertyDescriptors(i)):r(Object(i)).forEach((function(e){Object.defineProperty(t,e,Object.getOwnPropertyDescriptor(i,e))}))}return t}const a={maxCount:150,speed:3,frameInterval:15,alpha:1,gradient:!1};class c{constructor(t){var e=this;s()(this,"options",void 0),s()(this,"context",null),s()(this,"supportsAnimationFrame",window.requestAnimationFrame),s()(this,"colors",["rgba(30,144,255,","rgba(107,142,35,","rgba(255,215,0,","rgba(255,192,203,","rgba(106,90,205,","rgba(173,216,230,","rgba(238,130,238,","rgba(152,251,152,","rgba(70,130,180,","rgba(244,164,96,","rgba(210,105,30,","rgba(220,20,60,"]),s()(this,"lastFrameTime",Date.now()),s()(this,"particles",[]),s()(this,"waveAngle",0),s()(this,"isRunning",void 0),s()(this,"start",(async function(t){let i=arguments.length>1&&void 0!==arguments[1]?arguments[1]:3e3;if(!t)return;e.context=t.getContext("2d"),e.particles=[];const n=e.options.maxCount;for(;e.particles.length<n;)e.particles.push(e.resetParticle({},t.width,t.height));e.isRunning=!0,e.runAnimation(),i&&window.setTimeout(e.stop,i)})),s()(this,"stop",async()=>{this.isRunning=!1}),s()(this,"resetParticle",(t,e,i)=>(t.color=this.colors[Math.random()*this.colors.length|0]+(this.options.alpha+")"),this.options.gradient?t.color2=this.colors[Math.random()*this.colors.length|0]+(this.options.alpha+")"):t.color2=t.color,t.x=Math.random()*e,t.y=Math.random()*-i,t.diameter=10*Math.random()+5,t.tilt=-10*Math.random(),t.tiltAngleIncrement=.07*Math.random()+.05,t.tiltAngle=Math.random()*Math.PI,t)),s()(this,"runAnimation",()=>{if(this.context&&this.context.canvas)if(0===this.particles.length)this.context.clearRect(0,0,this.context.canvas.width,this.context.canvas.height);else{const t=Date.now(),e=t-this.lastFrameTime;(!this.supportsAnimationFrame||e>this.options.frameInterval)&&(this.context.clearRect(0,0,this.context.canvas.width,this.context.canvas.height),this.updateParticles(),this.drawParticles(this.context),this.lastFrameTime=t-e%this.options.frameInterval),requestAnimationFrame(this.runAnimation)}}),s()(this,"drawParticles",t=>{if(!this.context||!this.context.canvas)return;let e,i,n;for(const s of this.particles){if(this.context.beginPath(),t.lineWidth=s.diameter,i=s.x+s.tilt,e=i+s.diameter/2,n=s.y+s.tilt+s.diameter/2,this.options.gradient){const r=t.createLinearGradient(e,s.y,i,n);r.addColorStop(0,s.color),r.addColorStop(1,s.color2),t.strokeStyle=r}else t.strokeStyle=s.color;t.moveTo(e,s.y),t.lineTo(i,n),t.stroke()}}),s()(this,"updateParticles",()=>{if(!this.context||!this.context.canvas)return;const t=this.context.canvas.width,e=this.context.canvas.height;let i;this.waveAngle+=.01;for(let n=0;n<this.particles.length;n++)i=this.particles[n],!this.isRunning&&i.y<-15?i.y=e+100:(i.tiltAngle+=i.tiltAngleIncrement,i.x+=Math.sin(this.waveAngle)-.5,i.y+=.5*(Math.cos(this.waveAngle)+i.diameter+this.options.speed),i.tilt=15*Math.sin(i.tiltAngle)),(i.x>t+20||i.x<-20||i.y>e)&&(this.isRunning&&this.particles.length<=this.options.maxCount?this.resetParticle(i,t,e):(this.particles.splice(n,1),n--))}),this.options=o(o({},a),t)}}}}]);
//# sourceMappingURL=0.js.map