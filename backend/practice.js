// const date=new Date("2002-07-17T00:00:00.000+00:00")
// const day=date.getDay()
// console.log(day)


// const names=['apple','ball','cat']
// let copyNames=names
// console.log(copyNames)
//init date
// let day1 = new Date().toLocaleString('en-US', { weekday: 'long',});
// console.log(day1)

// const dateString = "2024-02-20";
// const jsDate =   new Date(dateString);

// console.log(jsDate);
// const data = [
//     { date: '2022-03-01', day: 'Wednesday' },
//     { date: '2022-03-02', day: 'Thursday' },
//     { date: '2022-03-03', day: 'Friday' }
//   ];

//   const [date,day] = data
//   console.log(day)


const obj = { ...true, ..."test", ...10 };
console.log(obj)
