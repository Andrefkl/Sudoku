using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Web.UI.WebControls;

namespace Sudoku
{
    public partial class Default : System.Web.UI.Page
    {
        Random Ran = new Random();
        static int Lives;
        bool DoRestart;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void HideNumbers(int hideCount)
        {
            for (int i = 0; i < hideCount; i++)
            {
                int ranNum = Ran.Next(1, 82);
                TextBox textBox = (TextBox)FindControl("TextBox" + ranNum);
                if (textBox.Text != "")
                {
                    textBox.ValidationGroup = textBox.Text;
                    textBox.Text = "";
                }
                else
                    i--;
            }
        }


        public void FillNumbersVTwo()
        {
            List<char> xValues = new List<char>();
            List<char> yValues = new List<char>();
            int ranNum = 0;
            int startNum;
            int endNum
                ;
            List<int> numsInRange = new List<int>();
            TextBox textBox = new TextBox();
            List<int> availableNums = new List<int>();
            availableNums = Enumerable.Range(1, 81).ToList(); // Fills the list with numbs from 1 to 82

            for (int s = 1; s <= 9; s++)
            {
                startNum = 1;
                endNum = 10;
                xValues.Clear();
                yValues.Clear();
                for (int i = 1; i <= 9; i++)
                {
                    // <Fill numsInRange with available nums in the correct 9X9 square>
                    foreach (int f in availableNums)
                    {
                        if (f >= startNum && f < endNum)
                        {
                            numsInRange.Add(f);
                            if (numsInRange.Count == 9)
                                break;
                        }
                    }
                    // </Fill numsInRange with available nums in the correct 9X9 square>

                    Commands.Shuffle(numsInRange);
                    DoRestart = true;
                    foreach (int num in numsInRange)
                    {
                        textBox = (TextBox)FindControl("TextBox" + num);

                        if (!xValues.Contains(textBox.SkinID[1]) && !yValues.Contains(textBox.SkinID[0]))
                        {
                            ranNum = num;
                            DoRestart = false;
                            break;
                        }
                    }

                    //do
                    //{
                    //    Teller++;
                    //    ranNum = Ran.Next(0, numsInRange.Count);
                    //    textBox = (TextBox)FindControl("TextBox" + numsInRange[ranNum]);

                    //    if (Teller >= 30) // If the code is stuck, restart.
                    //    {
                    //        break;
                    //    }
                    //}
                    //while (xValues.Contains(textBox.SkinID[1]) || yValues.Contains(textBox.SkinID[0]));

                    //if (Teller >= 30)
                    //    break;
                    if (DoRestart)
                        break;
                    textBox.Text = s.ToString();
                    //availableNums.Remove(numsInRange[ranNum]);
                    availableNums.Remove(ranNum);
                    xValues.Add(textBox.SkinID[1]);
                    yValues.Add(textBox.SkinID[0]);
                    startNum += 9;
                    endNum += 9;
                    numsInRange.Clear();
                }
                //if (Teller >= 30)
                //{
                //    break;
                //}
                if (DoRestart)
                    break;

            }
        }

        public void ResetBoard()
        {
            for (int i = 1; i <= 81; i++)
            {
                TextBox textBox = (TextBox)FindControl("TextBox" + i);
                textBox.Text = "";
                textBox.ForeColor = Color.Black;
                textBox.Enabled = true;
            }
            ImageHearts1.Visible = ImageHearts2.Visible = ImageHearts3.Visible = true;
        }

        protected void TextBox_TextChanged(object sender, EventArgs e)
        {            
            TextBox clickedBox = (TextBox)sender;
            clickedBox.ForeColor = Color.Black;

            if (clickedBox.Text != clickedBox.ValidationGroup && clickedBox.Text != "")
            {
                clickedBox.ForeColor = Color.Red;
                Lives -= 1;
                LabelLives.Text = Lives.ToString();

                if (Lives == 0)
                    Loose();
            }
            else
            {
                clickedBox.ForeColor = Color.Black;
            }
                //clickedBox.Enabled = false;

            if (clickedBox.Text == "")
                clickedBox.Enabled = true;

            UpdateHearts();
            CheckNumsOnBoard();
        }

        public void UpdateHearts()
        {
            if (Lives < 3)
                ImageHearts3.Visible = false;
            if (Lives < 2)
                ImageHearts2.Visible = false;
            if (Lives < 1)
                ImageHearts1.Visible = false;
        }

        public void Loose()
        {
            LabelInfo.Text = "Ha you noob you loose";

            for (int i = 1; i <= 81; i++)
            {
                TextBox textBox = (TextBox)FindControl("TextBox" + i);
                textBox.Enabled = false;
            }
        }

        protected void ButtonFillBoard_Click(object sender, EventArgs e)
        {
            FillBoard();
        }

        public void FillBoard()
        {
            Stopwatch time = new Stopwatch();
            time.Start();
            int ResetCount = 0;
            FillNumbersVTwo();

            while (DoRestart)
            {
                ResetCount++;
                ResetBoard();
                FillNumbersVTwo();
            }
            time.Stop();
            LabelInfo.Text = "This board took " + ResetCount + " tries to make, and took " + time.ElapsedMilliseconds + " milliseconds";
            CheckNumsOnBoard();
        }

        public void CheckNumsOnBoard()
        {
            int[] availableNums = new int[10];
            for (int i = 1; i <= 81; i++)
            {
                TextBox textBox = (TextBox)FindControl("TextBox" + i);
                
                if (textBox.Text != "")
                {
                    int textBoxNum = int.Parse(textBox.Text);
                    availableNums[textBoxNum]++;
                }
            }

            for (int i = 1; i <= 9; i++)
            {
                Label labelNum = (Label)FindControl("Label" + i);
                if (availableNums[i] == 9 || availableNums[i] == 10)
                {
                    labelNum.Visible = false;
                }
                else
                    labelNum.Visible = true;
            }
        }

        protected void ButtonHideNumbers_Click(object sender, EventArgs e)
        {
            int hideAmount = int.Parse(TextBoxHideCount.Text);
            HideNumbers(hideAmount);
        }

        protected void ButtonEasy_Click(object sender, EventArgs e)
        {
            // Easy should hide 36 and start with 3 lives
            Lives = 3;
            ResetBoard();
            FillBoard();
            HideNumbers(36);
            LabelLives.Text = Lives.ToString();
        }

        

        protected void ButtonMedium_Click(object sender, EventArgs e)
        {
            // Medium should hide 46 and start with 3 lives
            Lives = 3;
            ResetBoard();
            FillBoard();
            HideNumbers(46);
            LabelLives.Text = Lives.ToString();
        }

        protected void ButtonHard_Click(object sender, EventArgs e)
        {
            // Hard should hide 56 and start with 3 lives
            Lives = 3;
            ResetBoard();
            FillBoard();
            HideNumbers(56);
            LabelLives.Text = Lives.ToString();
        }
    }

    public static class Commands
    {
        static Random rng = new Random();
        public static void Shuffle<T>(this IList<T> list)
        {
            int n = list.Count;
            while (n > 1)
            {
                n--;
                int k = rng.Next(n + 1);
                T value = list[k];
                list[k] = list[n];
                list[n] = value;
            }
        }
    }
}